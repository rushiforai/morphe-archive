from PIL import Image

images = {
    'blush_lilac': r'C:\Users\HP Omnibook X Flip\Downloads\SCREEN\Gemini_Generated_Image_5to93x5to93x5to9.jpg',
    'cotton_candy': r'C:\Users\HP Omnibook X Flip\Downloads\SCREEN\Gemini_Generated_Image_jg0bxijg0bxijg0b.jpg',
    'sunset_peach': r'C:\Users\HP Omnibook X Flip\Downloads\SCREEN\Gemini_Generated_Image_rbx9iwrbx9iwrbx9.jpg',
    'fresh_mint': r'C:\Users\HP Omnibook X Flip\Downloads\SCREEN\Gemini_Generated_Image_jc2k91jc2k91jc2k.jpg',
    'default': r'C:\Users\HP Omnibook X Flip\Downloads\SCREEN\Gemini_Generated_Image_hgboqahgboqahgbo.jpg'
}

for name, path in images.items():
    im = Image.open(path).convert('RGB')
    w, h = im.size
    # Sample points:
    # 1. Window bg around y=1800, x=500
    bg_color = im.getpixel((500, int(h * 0.6)))
    # 2. Container card around y=500, x=300
    card_color = im.getpixel((300, int(h * 0.17)))
    # 3. Switch track around y=500, x=1150
    switch_color = im.getpixel((int(w * 0.83), int(h * 0.175)))
    # 4. Category text around x=200, y=850
    cat_color = im.getpixel((int(w * 0.15), int(h * 0.28)))
    # 5. Icon around x=100, y=1100
    icon_color = im.getpixel((int(w * 0.08), int(h * 0.36)))
    # 6. Radio button selected center around x=1200, y=1100
    radio_color = im.getpixel((int(w * 0.88), int(h * 0.36)))
    
    print(f"=== {name} ===")
    print(f"  Window Bg:      #{bg_color[0]:02X}{bg_color[1]:02X}{bg_color[2]:02X}")
    print(f"  Card Container: #{card_color[0]:02X}{card_color[1]:02X}{card_color[2]:02X}")
    print(f"  Switch Track:   #{switch_color[0]:02X}{switch_color[1]:02X}{switch_color[2]:02X}")
    print(f"  Category Header:#{cat_color[0]:02X}{cat_color[1]:02X}{cat_color[2]:02X}")
    print(f"  Icon Tint:      #{icon_color[0]:02X}{icon_color[1]:02X}{icon_color[2]:02X}")
    print(f"  Radio Button:   #{radio_color[0]:02X}{radio_color[1]:02X}{radio_color[2]:02X}")
