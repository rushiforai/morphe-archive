import os
import subprocess

sources = []
for root, dirs, files in os.walk('pixelboard-patches/extensions/extension/src/main/java'):
    for f in files:
        if f.endswith('.java'):
            sources.append(os.path.abspath(os.path.join(root, f)))

os.makedirs('build_classes', exist_ok=True)
sources_file = os.path.abspath('tools/sources.txt')
with open(sources_file, 'w', encoding='utf-8') as f:
    for s in sources:
        # replace backslashes with forward slashes for javac argfile compatibility
        f.write(f'"{s.replace(chr(92), "/")}"\n')

android_jar = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"
cmd = [
    'javac',
    '-cp', android_jar,
    '-d', 'build_classes',
    f'@{sources_file}'
]

print("Running:", ' '.join(cmd))
res = subprocess.run(cmd, capture_output=True, text=True)
print("Exit code:", res.returncode)
if res.stdout:
    print("STDOUT:", res.stdout)
if res.stderr:
    print("STDERR:", res.stderr)

if res.returncode == 0:
    print(f"Compilation SUCCESSFUL! {len(sources)} files compiled.")
else:
    print("Compilation FAILED!")
