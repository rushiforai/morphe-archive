import os
import re

for root, dirs, files in os.walk("patches/src/main/kotlin"):
    for file in files:
        if file.endswith(".kt"):
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
            
            # Replace TADa with TADa in description = "..." and patchName = "..."
            def replacer(match):
                prefix = match.group(1)
                text = match.group(2)
                text = text.replace("TADa", "TADa")
                text = text.replace("tada", "tada")
                return f'{prefix}"{text}"'
                
            new_content = re.sub(r'(description\s*=\s*)"([^"]*)"', replacer, content)
            new_content = re.sub(r'(patchName\s*=\s*)"([^"]*)"', replacer, new_content)
            
            if new_content != content:
                with open(filepath, "w", encoding="utf-8") as f:
                    f.write(new_content)
