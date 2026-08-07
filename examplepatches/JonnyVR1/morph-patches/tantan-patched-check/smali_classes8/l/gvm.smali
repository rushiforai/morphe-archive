.class public final synthetic Ll/gvm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nvm;


# direct methods
.method public synthetic constructor <init>(Ll/nvm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gvm;->a:Ll/nvm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvm;->a:Ll/nvm;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/nvm;->h(Ll/nvm;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
