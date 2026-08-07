.class public final synthetic Ll/uja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uja;->a:Ll/jka;

    iput-object p2, p0, Ll/uja;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/uja;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/uja;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/uja;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/uja;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/uja;->a:Ll/jka;

    iget-object v1, p0, Ll/uja;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/uja;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/uja;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/uja;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/uja;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Ll/jka;->u2(Ll/jka;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
