.class public final synthetic Ll/uha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/jka;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uha;->a:Ll/jka;

    iput-boolean p2, p0, Ll/uha;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uha;->a:Ll/jka;

    iget-boolean p0, p0, Ll/uha;->b:Z

    invoke-static {v0, p0}, Ll/jka;->i3(Ll/jka;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
