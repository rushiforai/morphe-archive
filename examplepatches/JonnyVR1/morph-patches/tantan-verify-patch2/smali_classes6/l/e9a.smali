.class public final synthetic Ll/e9a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/jv00;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ll/jv00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9a;->a:Ll/jka;

    iput-object p2, p0, Ll/e9a;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e9a;->c:Ll/jv00;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e9a;->a:Ll/jka;

    iget-object v1, p0, Ll/e9a;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/e9a;->c:Ll/jv00;

    invoke-static {v0, v1, p0}, Ll/jka;->x1(Ll/jka;Ljava/lang/String;Ll/jv00;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
