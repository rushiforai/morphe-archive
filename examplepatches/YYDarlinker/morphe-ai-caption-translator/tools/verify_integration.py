"""Check sources, compiled dependencies and packages without network/original-workspace access."""
from collections import Counter
from pathlib import Path
from verify_current import long_path
import argparse,hashlib,json,re,zipfile,io
R=Path(__file__).resolve().parents[1]
PREFIX='app/yydarlinker/deepseekcaptions/'
CORE_BANNED=['CaptionApplication','CaptionOverlay','CaptionActions','DeepSeekConfig','SecureApiKey','DeepSeekCaptionHook','CaptionStrings','TokenCostAudit','CaptionPlayerAuthority','CaptionSurface','NativeCaptionBridge','RawCaptionSource','SourceCaptionCache','ProviderModelCatalog']
UI_BANNED=['RebuildController','RebuildApi','RebuildProtocol','RebuildPlanner','TranslationRuntime','TranslationAudit','ProviderRequestPolicy','MeaningTransport','MeaningWire','CaptionCore']
DEAD=['app/yydarlinker/caption/core/CaptionCore','MeaningTransport','MeaningWire','MeaningPlannerWire','PlainMeaningWire','BatchMeaningWire','SourcePreparationWire','N39Application','RebuildSourcePlan','RebuildSemanticTimeline','RebuildSemanticStore','RebuildSupplyPolicy','RelationCandidate','FrozenDev3','CaptionSemanticUnit','CaptionRenderFrame','CaptionPageScheduler','CaptionPresentationCursor','CaptionPresentationState','MeaningPager','SentenceCandidate','TranslationRetryPolicy']
def sha(data):return hashlib.sha256(data).hexdigest()

# Source ownership, rather than a list of future helper names, defines these edges.
# Host/infrastructure/UI still compile together; this is a lexical source guard, not an AST
# or a claim about reflection. Every same-side helper is scanned, including unreferenced ones.
SOURCE_AREAS = ('caption-contracts', 'caption-shared', 'translation-core',
                'application-host', 'infrastructure', 'presentation', 'ui',
                'extensions/extension', 'ui-preview', 'patches')
SOURCE_FORBIDDEN = {
    'translation-core': {'application-host', 'infrastructure', 'presentation', 'ui',
                         'extensions/extension', 'ui-preview', 'patches'},
    'caption-shared': {'translation-core', 'application-host', 'infrastructure',
                       'presentation', 'ui', 'extensions/extension', 'ui-preview', 'patches'},
    'caption-contracts': set(SOURCE_AREAS) - {'caption-contracts'},
    'ui': {'translation-core'},
    'presentation': {'translation-core'},
}

def source_code(text):
    """Erase comments and literals in one pass, so URLs cannot eat following code.

    Java/Kotlin strings, text blocks/raw strings, chars and nested Kotlin block comments
    are ignored. Java Unicode escapes are expanded before tokenization (JLS ordering).
    Kotlin interpolation/dynamic lookup is outside this lexical guard's scope.
    """
    text = re.sub(r'\\u+([0-9a-fA-F]{4})', lambda m: chr(int(m[1], 16)), text)
    out = []; at = 0
    token = re.compile(r'//[^\n]*|/\*|"""[\s\S]*?"""|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')
    while (match := token.search(text, at)):
        out.append(text[at:match.start()]); end = match.end()
        if match.group() == '/*':
            depth = 1
            while depth and end < len(text):
                if text.startswith('/*', end): depth += 1; end += 2
                elif text.startswith('*/', end): depth -= 1; end += 2
                else: end += 1
        erased = text[match.start():end]
        out.append(''.join('\n' if c == '\n' else ' ' for c in erased)); at = end
    out.append(text[at:]); return ''.join(out)

def source_dependencies(root):
    """Discover top-level project types, then reject references across forbidden areas.

    Imports (including static/wildcard and Kotlin aliases), qualified references and
    same-package simple names are checked. Unknown external/generated types, ambiguous
    shadowing and runtime/reflection edges require review or separate package checks.
    """
    units = []; owners = {}
    for area in SOURCE_AREAS:
        for language in ('java', 'kotlin'):
            for path in sorted((root / area / 'src/main' / language).rglob('*')):
                if path.suffix not in ('.java', '.kt'): continue
                code = source_code(path.read_text(encoding='utf-8-sig'))
                package = re.search(r'\bpackage\s+([\w.]+)', code)
                package = package[1] if package else ''
                depth = 0; types = []
                for m in re.finditer(r'[{}]|\b(?:class|interface|enum|record|object|typealias)\s+(\w+)', code):
                    if m.group() == '{': depth += 1
                    elif m.group() == '}': depth -= 1
                    elif depth == 0: types.append(m[1])
                for name in types: owners.setdefault(package + '.' + name, set()).add(area)
                units.append((path, area, package, code))
    errors = []
    for path, area, package, code in units:
        forbidden = SOURCE_FORBIDDEN.get(area, set())
        if not forbidden: continue
        # Dotted tokens cover imports, nested types and static methods too.
        refs = set(re.findall(r'\b[A-Za-z_$][\w$]*(?:\s*\.\s*[A-Za-z_$][\w$]*)*', code))
        refs = {re.sub(r'\s+', '', value) for value in refs}
        imports = re.findall(r'\bimport\s+(?:static\s+)?([\w.]+(?:\*)?)', code)
        for fq, target_areas in owners.items():
            if not target_areas.intersection(forbidden): continue
            target_package, name = fq.rsplit('.', 1)
            qualified = any(ref == fq or ref.startswith(fq + '.') for ref in refs)
            imported = any(value == fq or value.startswith(fq + '.')
                           or value == target_package + '.*' for value in imports)
            local = package == target_package and any(ref == name or ref.startswith(name + '.') for ref in refs)
            if qualified or imported or local:
                errors.append(f'{path.relative_to(root).as_posix()} depends on {fq} '
                              f'[{area} -> {",".join(sorted(target_areas.intersection(forbidden)))}]')
        if area == 'translation-core' and re.search(r'\bandroid\.(app|view|widget)\.', code):
            errors.append(f'{path.relative_to(root).as_posix()} references an Android UI component')
    return dict(errors=sorted(set(errors)), source_files=len(units), project_types=len(owners),
                scope='Lexical Java/Kotlin main-source ownership; no reflection/runtime reachability proof')

def constants(path):
    data=long_path(path).read_bytes();assert data[:4]==b'\xca\xfe\xba\xbe'
    count=int.from_bytes(data[8:10],'big');at=10;i=1;out=[]
    while i<count:
        tag=data[at];at+=1
        if tag==1:
            size=int.from_bytes(data[at:at+2],'big');at+=2;out.append(data[at:at+size].decode('utf-8','replace'));at+=size
        elif tag in (7,8,16,19,20):at+=2
        elif tag in (9,10,11,12,17,18,3,4):at+=4
        elif tag in (5,6):at+=8;i+=1
        elif tag==15:at+=3
        else:raise ValueError(f'unknown constant tag {tag}')
        i+=1
    return out
# Reviewed source-quote wire policy. Hash the complete literal multiset, including counts.
# Snapshots remain independently hash-pinned by provenance; no arbitrary literal change is allowed.
PINNED_LITERAL_COUNTS_SHA256 = {'RebuildApi': '9c4bf64fd6fa5acfd6509d26d176c49f083d3dec0126a078e572137c6703c287', 'RebuildProtocol': 'adbc7a11c060a473688a5aff228cd1ffa5e9776810fcc2fd75cb800b3aade866'}

def literal_contract(name, original, current):
    counts = sorted(Counter(current).items())
    return sha(json.dumps(counts, separators=(',', ':')).encode()) == PINNED_LITERAL_COUNTS_SHA256[name]

def literals(path):
    pattern=r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\.|[^"\\])*"'
    # Adjacent literals joined by + are one value, so re-wrapping a long prompt is not a change.
    text=re.sub(r"'(?:\\.|[^'\\])'","''",path.read_text(encoding='utf-8-sig'))  # char literals
    text=re.sub(r'"\s*\+\s*"','',text)
    return [m.group() for m in re.finditer(pattern,text) if m.group().startswith('"')]
def inspect(source_only=False,core_classes=None,mpp=None,mpe=None,ui_apk=None):
    errors=[];facts={}
    dependencies = source_dependencies(R)
    errors.extend(dependencies['errors'])
    facts['source_dependencies'] = dependencies
    for module,banned in [('translation-core',CORE_BANNED),('caption-shared',CORE_BANNED+UI_BANNED),('ui',UI_BANNED),('presentation',UI_BANNED)]:
        for path in (R/module/'src/main/java').rglob('*.java'):
            source=source_code(path.read_text(encoding='utf-8-sig'))
            for name in banned:
                if re.search(r'\b'+name+r'\b',source):errors.append(f'{path.relative_to(R)} depends on {name}')
            if module=='translation-core' and re.search(r'\bimport\s+android\.(app|view|widget)\.',source):errors.append(f'{path.relative_to(R)} imports a UI component')
    provenance=json.loads((R/'docs/core-provenance.json').read_text(encoding='utf-8'))
    for row in provenance['files']:
        if sha((R/row['snapshot']).read_bytes())!=row['upstream_sha256']:errors.append('changed pinned snapshot: '+row['snapshot'])
        if sha((R/row['destination']).read_bytes())!=row['sha256']:errors.append('unrecorded core adaptation: '+row['destination'])
    for row in provenance.get('new_files',[]):
        if sha((R/row['path']).read_bytes())!=row['sha256']:errors.append('unrecorded core adapter: '+row['path'])
    for row in provenance.get('protected_abi',[]):
        text=(R/row['path']).read_text(encoding='utf-8-sig')
        signatures=sorted(re.sub(r'\s+',' ',m.group(1)).strip() for m in re.finditer(r'(public\s+static\s+[\w<>?,\[\]. ]+\s+\w+\s*\([^)]*\))\s*\{',text))
        if signatures!=row['signatures']:errors.append('public Hook/native ABI changed: '+row['path'])
    for name in ['LICENSE','NOTICE']:
        if not (R/'translation-core/upstream'/name).is_file():errors.append('upstream license absent: '+name)
    for name in ['RebuildApi','RebuildProtocol']:
        original=literals(R/'translation-core/upstream'/(name+'.java.txt'))
        current=literals(R/'translation-core/src/main/java/app/yydarlinker/deepseekcaptions'/(name+'.java'))
        if name=='RebuildProtocol':
            if current.count('"1.4.0"') != 1:
                errors.append('upstream prompt/protocol literals changed: '+name)
            else:
                current.remove('"1.4.0"')
        if not literal_contract(name,original,current):
            errors.append('upstream prompt/protocol literals changed: '+name)
    facts['pinned_core']={k:provenance[k] for k in ['repository','branch','commit']}
    facts['prompt_and_protocol_literals_unchanged']=False  # Source-only wire and fidelity guidance are explicit local adaptations.
    facts['prompt_and_protocol_literals_authorized']=not any('literals changed' in e for e in errors)
    settings=(R/'settings.gradle.kts').read_text(encoding='utf-8-sig')
    if ':caption-core' in settings or 'archive/' in settings:errors.append('retired implementation included in Gradle settings')
    preview=(R/'ui-preview/build.gradle.kts').read_text(encoding='utf-8-sig')
    if 'project(":translation-core")' in preview:errors.append('UI preview depends on translation core')
    if not source_only:
        if any(p is None for p in (core_classes,mpp,mpe,ui_apk)):
            facts['errors']=['full inspection requires explicit core classes, MPP, standalone MPE and UI APK from this build']
            return facts
        classes=list(core_classes.rglob('*.class'))
        if not classes:errors.append('core compiled classes missing')
        for path in classes:
            for value in constants(path):
                if any(PREFIX+n in value or PREFIX.replace('/','.')+n in value for n in CORE_BANNED):errors.append(f'compiled core depends on app/UI: {path.name}: {value}')
        facts['compiled_core_class_count']=len(classes)
        if not mpp.is_file():errors.append('specified Android MPP missing; run :patches:buildAndroid')
        else:
            with zipfile.ZipFile(mpp) as z:
                names=z.namelist();embedded=[n for n in names if n.endswith('.mpe')]
                if 'classes.dex' not in names:errors.append('Manager root classes.dex missing from MPP')
                if len(embedded)!=1:errors.append('expected exactly one embedded MPE')
                else:
                    embedded_bytes=z.read(embedded[0]);independent=[mpe] if mpe.is_file() and mpe.read_bytes()==embedded_bytes else []
                    if not independent:errors.append('embedded MPE differs from standalone MPE')
                    if embedded_bytes.startswith(b'dex\n'):dex=embedded_bytes
                    elif zipfile.is_zipfile(io.BytesIO(embedded_bytes)):
                        with zipfile.ZipFile(io.BytesIO(embedded_bytes)) as ext:dex=b''.join(ext.read(n) for n in ext.namelist() if n.endswith('.dex'))
                    else:dex=b''
                    if not dex:errors.append('extension DEX missing')
                    for dead in DEAD:
                        if dead.encode() in dex:errors.append('retired core still packaged: '+dead)
                    for live in ['RebuildController','RebuildApi','RebuildProtocol','CaptionApplication']:
                        if (PREFIX+live).encode() not in dex:errors.append('production class absent: '+live)
                    for fixture in ['CoreSessionIntegrationTest','PinnedCoreLiveTest','N39UiPreviewActivity','org/robolectric']:
                        if fixture.encode() in dex:errors.append('test/preview implementation packaged in production: '+fixture)
                    facts['android_patch']={'path':str(mpp.resolve()),'sha256':sha(mpp.read_bytes()),'size':mpp.stat().st_size,'manager_dex':True,'embedded_mpe_sha256':sha(embedded_bytes),'standalone_mpe':[str(p.resolve()) for p in independent],'embedded_mpe_equal_to_standalone':bool(independent)}
                locales=[n for n in names if n.endswith('caption_addon_strings.xml')]
                facts['packaged_locale_files']=len(locales)
                if len(locales)!=14:errors.append(f'expected 14 packaged locale files, got {len(locales)}')
                for name in locales+['captionlocales/index.txt']:
                    source=R/'patches/src/main/resources'/name
                    if not source.is_file() or source.read_bytes()!=z.read(name):errors.append('packaged resource differs from current source: '+name)
        if not ui_apk.is_file():errors.append('specified UI preview APK missing')
        else:
            with zipfile.ZipFile(ui_apk) as z:
                dex=b''.join(z.read(n) for n in z.namelist() if n.endswith('.dex'))
                for name in UI_BANNED:
                    if (PREFIX+name).encode() in dex:errors.append('UI preview contains a translator: '+name)
                if b'android.permission.INTERNET' in z.read('AndroidManifest.xml').replace(b'\x00',b''):errors.append('UI preview requests INTERNET')
            facts['independent_ui_apk']={'path':str(ui_apk.resolve()),'sha256':sha(ui_apk.read_bytes()),'translation_core_present':False}
    facts['errors']=errors;facts['scope']='Main source ownership and legacy name guards; compiled constants scan only the supplied core classes, not the extension; package exclusions/provenance/ABI/protocol remain separate. No dynamic/reflection reachability, OEM or semantic-quality certification.'
    return facts
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--source-only',action='store_true');p.add_argument('--output',type=Path,default=R/'validation/boundaries.json')
    for name in ('core-classes','mpp','mpe','ui-apk'):p.add_argument('--'+name,type=Path)
    a=p.parse_args()
    result=inspect(a.source_only,a.core_classes,a.mpp,a.mpe,a.ui_apk);a.output.parent.mkdir(parents=True,exist_ok=True);a.output.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2));raise SystemExit(bool(result['errors']))
