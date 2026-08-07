.class public final synthetic Ll/yt90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/du90;

.field public final synthetic b:Ll/ner;


# direct methods
.method public synthetic constructor <init>(Ll/du90;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yt90;->a:Ll/du90;

    iput-object p2, p0, Ll/yt90;->b:Ll/ner;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yt90;->a:Ll/du90;

    iget-object p0, p0, Ll/yt90;->b:Ll/ner;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, p0, p1}, Ll/du90;->U(Ll/du90;Ll/ner;Landroid/os/Bundle;)V

    return-void
.end method
