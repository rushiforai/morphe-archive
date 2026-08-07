.class public Lorg/eclipse/jetty/continuation/ContinuationFilter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gli;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;
    }
.end annotation


# static fields
.field static __debug:Z

.field static _initialized:Z


# instance fields
.field _context:Ll/ase0;

.field private _debug:Z

.field private _faux:Z

.field private _filtered:Z

.field private _jetty6:Z


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

.method private debug(Ljava/lang/String;)V
    .locals 1

    .line 39
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_debug:Z

    if-eqz v0, :cond_0

    .line 40
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_context:Ll/ase0;

    invoke-interface {p0, p1}, Ll/ase0;->log(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_debug:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p2, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_context:Ll/ase0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, ":"

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p0, p1}, Ll/ase0;->log(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/ase0;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    return-void
.end method

.method public doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_filtered:Z

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    const-string v0, "org.eclipse.jetty.continuation"

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lorg/eclipse/jetty/continuation/Continuation;

    .line 12
    .line 13
    iget-boolean v2, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_faux:Z

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    instance-of v2, v1, Lorg/eclipse/jetty/continuation/FauxContinuation;

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    :cond_0
    new-instance v1, Lorg/eclipse/jetty/continuation/FauxContinuation;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Lorg/eclipse/jetty/continuation/FauxContinuation;-><init>(Ll/gse0;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v0, v1}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;

    .line 33
    .line 34
    :goto_0
    const/4 v2, 0x0

    .line 35
    :cond_2
    move v3, v2

    .line 36
    :cond_3
    :goto_1
    if-nez v3, :cond_b

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    if-eqz v1, :cond_4

    .line 40
    .line 41
    :try_start_0
    invoke-interface {v1, p2}, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;->enter(Ll/lse0;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_5

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_4

    .line 50
    :catch_0
    move-exception v4

    .line 51
    goto :goto_3

    .line 52
    :cond_4
    :goto_2
    invoke-interface {p3, p1, p2}, Ll/nli;->doFilter(Ll/gse0;Ll/lse0;)V
    :try_end_0
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    :cond_5
    if-nez v1, :cond_6

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;

    .line 62
    .line 63
    :cond_6
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-interface {v1}, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;->exit()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :goto_3
    :try_start_1
    const-string v5, "faux"

    .line 73
    .line 74
    invoke-direct {p0, v5, v4}, Lorg/eclipse/jetty/continuation/ContinuationFilter;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    .line 76
    .line 77
    if-nez v1, :cond_7

    .line 78
    .line 79
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;

    .line 84
    .line 85
    :cond_7
    if-eqz v1, :cond_3

    .line 86
    .line 87
    invoke-interface {v1}, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;->exit()Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :goto_4
    if-nez v1, :cond_8

    .line 95
    .line 96
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    move-object v1, p1

    .line 101
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;

    .line 102
    .line 103
    :cond_8
    if-eqz v1, :cond_9

    .line 104
    .line 105
    invoke-interface {v1}, Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;->exit()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    :cond_9
    throw p0

    .line 110
    :cond_a
    :try_start_2
    invoke-interface {p3, p1, p2}, Ll/nli;->doFilter(Ll/gse0;Ll/lse0;)V
    :try_end_2
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_2 .. :try_end_2} :catch_1

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :catch_1
    move-exception p1

    .line 115
    const-string p2, "caught"

    .line 116
    .line 117
    invoke-direct {p0, p2, p1}, Lorg/eclipse/jetty/continuation/ContinuationFilter;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    :cond_b
    return-void
.end method

.method public init(Ll/sli;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "org.eclipse.jetty.servlet"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-interface {p1}, Ll/sli;->getServletContext()Ll/ase0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_context:Ll/ase0;

    .line 24
    .line 25
    const-string v1, "debug"

    .line 26
    .line 27
    invoke-interface {p1, v1}, Ll/sli;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    move v1, v3

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v1, v2

    .line 44
    :goto_0
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_debug:Z

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    sput-boolean v3, Lorg/eclipse/jetty/continuation/ContinuationFilter;->__debug:Z

    .line 49
    .line 50
    :cond_1
    const-string v1, "jetty6"

    .line 51
    .line 52
    invoke-interface {p1, v1}, Ll/sli;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    const-string v1, "partial"

    .line 59
    .line 60
    invoke-interface {p1, v1}, Ll/sli;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    :cond_2
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_jetty6:Z

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    sget-boolean v1, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__jetty6:Z

    .line 74
    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    move v1, v3

    .line 80
    goto :goto_1

    .line 81
    :cond_4
    move v1, v2

    .line 82
    :goto_1
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_jetty6:Z

    .line 83
    .line 84
    :goto_2
    const-string v1, "faux"

    .line 85
    .line 86
    invoke-interface {p1, v1}, Ll/sli;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-eqz p1, :cond_5

    .line 91
    .line 92
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_faux:Z

    .line 97
    .line 98
    goto :goto_4

    .line 99
    :cond_5
    if-nez v0, :cond_6

    .line 100
    .line 101
    iget-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_jetty6:Z

    .line 102
    .line 103
    if-nez p1, :cond_6

    .line 104
    .line 105
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_context:Ll/ase0;

    .line 106
    .line 107
    invoke-interface {p1}, Ll/ase0;->getMajorVersion()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    const/4 v1, 0x3

    .line 112
    if-ge p1, v1, :cond_6

    .line 113
    .line 114
    move p1, v3

    .line 115
    goto :goto_3

    .line 116
    :cond_6
    move p1, v2

    .line 117
    :goto_3
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_faux:Z

    .line 118
    .line 119
    :goto_4
    iget-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_faux:Z

    .line 120
    .line 121
    if-nez p1, :cond_7

    .line 122
    .line 123
    iget-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_jetty6:Z

    .line 124
    .line 125
    if-eqz p1, :cond_8

    .line 126
    .line 127
    :cond_7
    move v2, v3

    .line 128
    :cond_8
    iput-boolean v2, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_filtered:Z

    .line 129
    .line 130
    iget-boolean p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_debug:Z

    .line 131
    .line 132
    if-eqz p1, :cond_9

    .line 133
    .line 134
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_context:Ll/ase0;

    .line 135
    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v2, "ContinuationFilter  jetty="

    .line 139
    .line 140
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v0, " jetty6="

    .line 147
    .line 148
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_jetty6:Z

    .line 152
    .line 153
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v0, " faux="

    .line 157
    .line 158
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_faux:Z

    .line 162
    .line 163
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v0, " filtered="

    .line 167
    .line 168
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    iget-boolean p0, p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_filtered:Z

    .line 172
    .line 173
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string p0, " servlet3="

    .line 177
    .line 178
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    sget-boolean p0, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__servlet3:Z

    .line 182
    .line 183
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-interface {p1, p0}, Ll/ase0;->log(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_9
    sput-boolean v3, Lorg/eclipse/jetty/continuation/ContinuationFilter;->_initialized:Z

    .line 194
    .line 195
    return-void
.end method
