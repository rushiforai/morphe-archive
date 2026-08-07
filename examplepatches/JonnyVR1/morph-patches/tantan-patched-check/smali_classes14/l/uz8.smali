.class public final synthetic Ll/uz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/c09;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/c09;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uz8;->a:Ll/c09;

    iput-object p2, p0, Ll/uz8;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uz8;->a:Ll/c09;

    iget-object p0, p0, Ll/uz8;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/c09;->c3(Ll/c09;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
