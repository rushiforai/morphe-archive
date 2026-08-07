.class Ltech/sud/runtime/component/i/c$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/i/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/i/c;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/i/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 4

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->g(Ltech/sud/runtime/component/i/c;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "Error: "

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ","

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-static {p1, p3}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 33
    .line 34
    const/4 p3, -0x1

    .line 35
    invoke-static {p1, p3}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;I)I

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 39
    .line 40
    invoke-static {p1, p3}, Ltech/sud/runtime/component/i/c;->d(Ltech/sud/runtime/component/i/c;I)I

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 44
    .line 45
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p3, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    invoke-static {p3}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 59
    .line 60
    invoke-static {p0}, Ltech/sud/runtime/component/i/c;->b(Ltech/sud/runtime/component/i/c;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-interface {p1, p0}, Ltech/sud/runtime/component/i/d;->b(I)V

    .line 65
    .line 66
    .line 67
    return v0

    .line 68
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 75
    .line 76
    iget-object p1, p1, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const/16 p3, 0xc8

    .line 83
    .line 84
    const-string v1, "android"

    .line 85
    .line 86
    const-string v2, "string"

    .line 87
    .line 88
    if-ne p2, p3, :cond_1

    .line 89
    .line 90
    const-string p2, "VideoView_error_text_invalid_progressive_playback"

    .line 91
    .line 92
    invoke-virtual {p1, p2, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    goto :goto_0

    .line 97
    :cond_1
    const-string p2, "VideoView_error_text_unknown"

    .line 98
    .line 99
    invoke-virtual {p1, p2, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    :goto_0
    const-string p3, "VideoView_error_title"

    .line 104
    .line 105
    invoke-virtual {p1, p3, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    const-string v3, "VideoView_error_button"

    .line 110
    .line 111
    invoke-virtual {p1, v3, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    new-instance v2, Landroid/app/AlertDialog$Builder;

    .line 116
    .line 117
    iget-object v3, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 118
    .line 119
    iget-object v3, v3, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 120
    .line 121
    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-virtual {v2, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    invoke-virtual {p3, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    new-instance p3, Ltech/sud/runtime/component/i/c$3$1;

    .line 141
    .line 142
    invoke-direct {p3, p0}, Ltech/sud/runtime/component/i/c$3$1;-><init>(Ltech/sud/runtime/component/i/c$3;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    const/4 p1, 0x0

    .line 150
    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 155
    .line 156
    .line 157
    :cond_2
    return v0
.end method
