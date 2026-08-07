.class Ll/hki$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u660$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hki;->h(Landroid/content/Context;Ll/hki$d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/hki$d;

.field final synthetic b:Ll/hki;


# direct methods
.method public constructor <init>(Ll/hki;Ll/hki$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hki$a;->b:Ll/hki;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hki$a;->a:Ll/hki$d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hki$a;->a:Ll/hki$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/hki$d;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hki$a;->a:Ll/hki$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/hki$d;->b(ILjava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public c(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hki$a;->a:Ll/hki$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/hki$d;->c(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
