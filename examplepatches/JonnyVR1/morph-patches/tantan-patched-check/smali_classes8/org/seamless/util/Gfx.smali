.class public Lorg/seamless/util/Gfx;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getScaledInstance(Ljava/awt/image/BufferedImage;IILjava/lang/Object;Z)Ljava/awt/image/BufferedImage;
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getTransparency()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x2

    .line 10
    :goto_0
    if-eqz p4, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    move-object v4, p0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move-object v4, p0

    .line 23
    move v0, p1

    .line 24
    move v2, p2

    .line 25
    :goto_1
    if-eqz p4, :cond_2

    .line 26
    .line 27
    if-le v0, p1, :cond_2

    .line 28
    .line 29
    div-int/lit8 v0, v0, 0x2

    .line 30
    .line 31
    if-ge v0, p1, :cond_2

    .line 32
    .line 33
    move v7, p1

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v7, v0

    .line 36
    :goto_2
    if-eqz p4, :cond_3

    .line 37
    .line 38
    if-le v2, p2, :cond_3

    .line 39
    .line 40
    div-int/lit8 v2, v2, 0x2

    .line 41
    .line 42
    if-ge v2, p2, :cond_3

    .line 43
    .line 44
    move v8, p2

    .line 45
    goto :goto_3

    .line 46
    :cond_3
    move v8, v2

    .line 47
    :goto_3
    new-instance p0, Ljava/awt/image/BufferedImage;

    .line 48
    .line 49
    invoke-direct {p0, v7, v8, v1}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sget-object v0, Ljava/awt/RenderingHints;->KEY_INTERPOLATION:Ljava/awt/RenderingHints$Key;

    .line 57
    .line 58
    invoke-virtual {v3, v0, p3}, Ljava/awt/Graphics2D;->setRenderingHint(Ljava/awt/RenderingHints$Key;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    const/4 v9, 0x0

    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-virtual/range {v3 .. v9}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IIIILjava/awt/image/ImageObserver;)Z

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/awt/Graphics2D;->dispose()V

    .line 68
    .line 69
    .line 70
    if-ne v7, p1, :cond_4

    .line 71
    .line 72
    if-ne v8, p2, :cond_4

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_4
    move-object v4, p0

    .line 76
    move v0, v7

    .line 77
    move v2, v8

    .line 78
    goto :goto_1
.end method

.method public static resizeProportionally(Ljavax/swing/ImageIcon;Ljava/lang/String;II)[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    int-to-double v3, p2

    .line 10
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-double v5, v0

    .line 15
    div-double/2addr v3, v5

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-wide v3, v1

    .line 18
    :goto_0
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconHeight()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eq p3, v0, :cond_1

    .line 23
    .line 24
    int-to-double v0, p3

    .line 25
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-double v5, v2

    .line 30
    div-double v1, v0, v5

    .line 31
    .line 32
    :cond_1
    cmpg-double v0, v3, v1

    .line 33
    .line 34
    if-gez v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconHeight()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    int-to-double v0, p3

    .line 41
    mul-double/2addr v0, v3

    .line 42
    double-to-int p3, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconWidth()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    int-to-double v3, p2

    .line 49
    mul-double/2addr v3, v1

    .line 50
    double-to-int p2, v3

    .line 51
    :goto_1
    const-string v0, "image/png"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    const/4 v1, 0x2

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    const/4 v1, 0x1

    .line 62
    :goto_2
    new-instance v2, Ljava/awt/image/BufferedImage;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconWidth()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconHeight()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-direct {v2, v3, v4, v1}, Ljava/awt/image/BufferedImage;-><init>(III)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/awt/image/BufferedImage;->createGraphics()Ljava/awt/Graphics2D;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getImage()Ljava/awt/Image;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconWidth()I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    invoke-virtual {p0}, Ljavax/swing/ImageIcon;->getIconHeight()I

    .line 88
    .line 89
    .line 90
    move-result v10

    .line 91
    const/4 v11, 0x0

    .line 92
    const/4 v7, 0x0

    .line 93
    const/4 v8, 0x0

    .line 94
    invoke-virtual/range {v5 .. v11}, Ljava/awt/Graphics2D;->drawImage(Ljava/awt/Image;IIIILjava/awt/image/ImageObserver;)Z

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5}, Ljava/awt/Graphics2D;->dispose()V

    .line 98
    .line 99
    .line 100
    sget-object p0, Ljava/awt/RenderingHints;->VALUE_INTERPOLATION_NEAREST_NEIGHBOR:Ljava/lang/Object;

    .line 101
    .line 102
    const/4 v1, 0x0

    .line 103
    invoke-static {v2, p2, p3, p0, v1}, Lorg/seamless/util/Gfx;->getScaledInstance(Ljava/awt/image/BufferedImage;IILjava/lang/Object;Z)Ljava/awt/image/BufferedImage;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_4

    .line 112
    .line 113
    const-string p1, "png"

    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_4
    const-string p2, "image/jpeg"

    .line 117
    .line 118
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-nez p2, :cond_6

    .line 123
    .line 124
    const-string p2, "image/jpg"

    .line 125
    .line 126
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_5

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_5
    const-string p1, ""

    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_6
    :goto_3
    const-string p1, "jpeg"

    .line 137
    .line 138
    :goto_4
    new-instance p2, Ljava/io/ByteArrayOutputStream;

    .line 139
    .line 140
    const/16 p3, 0x400

    .line 141
    .line 142
    invoke-direct {p2, p3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 143
    .line 144
    .line 145
    invoke-static {p0, p1, p2}, Ljavax/imageio/ImageIO;->write(Ljava/awt/image/RenderedImage;Ljava/lang/String;Ljava/io/OutputStream;)Z

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method
