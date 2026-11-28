#!/usr/bin/env python3
"""Resolve only exact files needed for the independently reproduced build. No release actions."""
import argparse, hashlib, json, os, re, shutil, subprocess, tempfile
from pathlib import Path, PurePosixPath
from urllib.parse import urlsplit
T=Path(__file__).resolve().parent
HOSTS={'repo.maven.apache.org','dl.google.com','jitpack.io','maven.pkg.github.com'}
def sha(p):
    with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def require(ok,msg):
    if not ok:raise SystemExit('STOP: '+msg)
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('output',type=Path);p.add_argument('--from-directory',type=Path);p.add_argument('--android-jar',type=Path);p.add_argument('--verify-only',action='store_true');a=p.parse_args()
    require(not (a.verify_only and (a.from_directory or a.android_jar)),'verify-only does not copy or fetch')
    out=a.output.resolve(); rows=json.loads((T/'locks/ci-inputs.json').read_text()); seen=set(); byhash={}
    for r in rows:
        n=r['path']; rel=PurePosixPath(n);require(not rel.is_absolute() and '..' not in rel.parts and '\\' not in n and n not in seen,'bad locked path');seen.add(n)
        h=r['sha256'];require(re.fullmatch('[0-9a-f]{64}',h),'bad SHA256'); dest=out/n
        require(dest.resolve().is_relative_to(out),'unsafe destination')
        if dest.is_file():require(sha(dest)==h,'existing input mismatch: '+n);byhash[h]=dest;continue
        require(not a.verify_only,'missing input: '+n);dest.parent.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=dest.parent) as tmp:
            f=Path(tmp)/'download'
            if h in byhash:shutil.copyfile(byhash[h],f)
            elif a.from_directory:shutil.copyfile(a.from_directory/n,f)
            elif n=='fixed/libs/android.jar':
                require(a.android_jar and a.android_jar.is_file(),'provide exact locked SDK android.jar');shutil.copyfile(a.android_jar,f)
            else:
                u=urlsplit(r['url']);require(u.scheme=='https' and u.hostname in HOSTS and not u.username and not u.password,'unapproved download host')
                cmd=['curl','--proto','=https','--proto-redir','=https','--fail','--silent','--show-error','--location','--retry','2','--connect-timeout','20','--max-time','240','--output',str(f),r['url']];cfg=None
                if u.hostname=='maven.pkg.github.com':
                    user=os.environ.get('GITHUB_ACTOR',''); token=os.environ.get('GITHUB_TOKEN','');require(re.fullmatch('[A-Za-z0-9_-]+',user) and (bool(token) and all(33 <= ord(c) <= 126 and c not in (chr(34), chr(92)) for c in token)),'GitHub Packages read credentials required');cmd.extend(['--config','-']);cfg=f'user = "{user}:{token}"\n'
                subprocess.run(cmd,input=cfg,text=True,check=True)
            require(sha(f)==h,'download/copy hash mismatch: '+n);f.replace(dest)
        byhash[h]=dest
    actual={p.relative_to(out).as_posix() for p in out.rglob('*') if p.is_file()};require(actual==seen,'unexpected or missing input file(s)')
    print('PASS',len(rows),'locked files;',len(byhash),'distinct contents; no archive-layout dependency')
if __name__=='__main__':main()
