.class public Ll/ym4;
.super Ll/zq90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/qu90;)V
    .locals 2

    .line 1
    new-instance v0, Ll/d0f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d0f;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0}, Ll/zq90;-><init>(Landroid/content/Context;Ll/hp90;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v0, "user_id"

    .line 15
    .line 16
    iget-object v1, p2, Ll/qu90;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "is_edit"

    .line 22
    .line 23
    iget-boolean v1, p2, Ll/qu90;->c:Z

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    const-string v0, "input_type"

    .line 29
    .line 30
    iget-object v1, p2, Ll/qu90;->d:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string v0, "show_buttons"

    .line 36
    .line 37
    iget-boolean v1, p2, Ll/qu90;->b:Z

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    const-string v0, "canShowFollowButton"

    .line 43
    .line 44
    iget-boolean v1, p2, Ll/qu90;->l:Z

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    const-string v0, "no_showbuttons_infofromlocal"

    .line 50
    .line 51
    iget-boolean v1, p2, Ll/qu90;->j:Z

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 54
    .line 55
    .line 56
    const-string v0, "from"

    .line 57
    .line 58
    iget-object v1, p2, Ll/qu90;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v0, "open_media_picker"

    .line 64
    .line 65
    iget-boolean v1, p2, Ll/qu90;->f:Z

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p2, Ll/qu90;->g:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 71
    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    const-string v1, "relationship_status"

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    const-string v0, "button_flag"

    .line 84
    .line 85
    iget v1, p2, Ll/qu90;->h:I

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    const-string v0, "with_superlike"

    .line 91
    .line 92
    iget-boolean v1, p2, Ll/qu90;->i:Z

    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 95
    .line 96
    .line 97
    const-string v0, "pic_index"

    .line 98
    .line 99
    iget v1, p2, Ll/qu90;->m:I

    .line 100
    .line 101
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    const-string v0, "pushReason"

    .line 105
    .line 106
    iget v1, p2, Ll/qu90;->o:I

    .line 107
    .line 108
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    const-string v0, "pushTag"

    .line 112
    .line 113
    iget-object v1, p2, Ll/qu90;->p:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const-string v0, "city_centre_data"

    .line 119
    .line 120
    iget-object p2, p2, Ll/qu90;->q:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 121
    .line 122
    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/zq90;->d(Landroid/os/Bundle;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method
