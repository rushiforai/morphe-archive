with open('web_preview/index.html', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('v2.0.2', 'v2.0.3')
text = text.replace('Beta Dynamic Colors', 'Beta 3.3')
with open('web_preview/index.html', 'w', encoding='utf-8') as f:
    f.write(text)
print("Updated web_preview/index.html to v2.0.3 (Beta 3.3)")
