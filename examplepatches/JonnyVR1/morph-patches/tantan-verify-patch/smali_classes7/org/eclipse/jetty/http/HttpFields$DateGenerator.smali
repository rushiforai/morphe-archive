.class Lorg/eclipse/jetty/http/HttpFields$DateGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpFields;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DateGenerator"
.end annotation


# instance fields
.field private final buf:Ljava/lang/StringBuilder;

.field private final gc:Ljava/util/GregorianCalendar;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const/16 v1, 0x20

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 12
    .line 13
    new-instance v0, Ljava/util/GregorianCalendar;

    .line 14
    .line 15
    sget-object v1, Lorg/eclipse/jetty/http/HttpFields;->__GMT:Ljava/util/TimeZone;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/http/HttpFields$1;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;-><init>()V

    return-void
.end method


# virtual methods
.method public formatCookieDate(Ljava/lang/StringBuilder;J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 7
    .line 8
    const/4 v1, 0x7

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 14
    .line 15
    const/4 v2, 0x5

    .line 16
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    rem-int/lit16 p0, p0, 0x2710

    .line 35
    .line 36
    const-wide/16 v3, 0x3e8

    .line 37
    .line 38
    div-long/2addr p2, v3

    .line 39
    const-wide/32 v3, 0x15180

    .line 40
    .line 41
    .line 42
    rem-long/2addr p2, v3

    .line 43
    long-to-int p2, p2

    .line 44
    rem-int/lit8 p3, p2, 0x3c

    .line 45
    .line 46
    div-int/lit8 p2, p2, 0x3c

    .line 47
    .line 48
    rem-int/lit8 v3, p2, 0x3c

    .line 49
    .line 50
    div-int/lit8 p2, p2, 0x3c

    .line 51
    .line 52
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$000()[Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    aget-object v0, v4, v0

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const/16 v0, 0x2c

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const/16 v0, 0x20

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v1}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 72
    .line 73
    .line 74
    const/16 v1, 0x2d

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$100()[Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    aget-object v2, v4, v2

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    div-int/lit8 v1, p0, 0x64

    .line 92
    .line 93
    invoke-static {p1, v1}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 94
    .line 95
    .line 96
    rem-int/lit8 p0, p0, 0x64

    .line 97
    .line 98
    invoke-static {p1, p0}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-static {p1, p2}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 105
    .line 106
    .line 107
    const/16 p0, 0x3a

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-static {p1, v3}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-static {p1, p3}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 119
    .line 120
    .line 121
    const-string p0, " GMT"

    .line 122
    .line 123
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public formatDate(J)Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 13
    .line 14
    const/4 p2, 0x7

    .line 15
    invoke-virtual {p1, p2}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    div-int/lit8 v2, v1, 0x64

    .line 41
    .line 42
    rem-int/lit8 v1, v1, 0x64

    .line 43
    .line 44
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 45
    .line 46
    const/16 v4, 0xb

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    iget-object v4, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 53
    .line 54
    const/16 v5, 0xc

    .line 55
    .line 56
    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    iget-object v5, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->gc:Ljava/util/GregorianCalendar;

    .line 61
    .line 62
    const/16 v6, 0xd

    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    iget-object v6, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$000()[Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    aget-object p1, v7, p1

    .line 75
    .line 76
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const/16 v6, 0x2c

    .line 82
    .line 83
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const/16 v6, 0x20

    .line 89
    .line 90
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-static {p1, p2}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-static {}, Lorg/eclipse/jetty/http/HttpFields;->access$100()[Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    aget-object p2, p2, v0

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-static {p1, v2}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-static {p1, v1}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-static {p1, v3}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const/16 p2, 0x3a

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-static {p1, v4}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-static {p1, v5}, Lorg/eclipse/jetty/util/StringUtil;->append2digits(Ljava/lang/StringBuilder;I)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string p2, " GMT"

    .line 164
    .line 165
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$DateGenerator;->buf:Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method
