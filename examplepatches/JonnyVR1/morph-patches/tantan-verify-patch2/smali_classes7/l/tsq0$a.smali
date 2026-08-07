.class Ll/tsq0$a;
.super Ll/tsq0$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tsq0;->m(Ll/tsq0$c;IIZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic b:Z

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ll/tsq0;


# direct methods
.method public constructor <init>(Ll/tsq0;Ll/tsq0$c;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tsq0$a;->d:Ll/tsq0;

    .line 2
    .line 3
    iput-boolean p3, p0, Ll/tsq0$a;->b:Z

    .line 4
    .line 5
    iput-object p4, p0, Ll/tsq0$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ll/tsq0$d;-><init>(Ll/tsq0$c;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/tsq0$d;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tsq0$a;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/tsq0$a;->d:Ll/tsq0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/tsq0;->a(Ll/tsq0;)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/tsq0$a;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-interface {v0, p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
