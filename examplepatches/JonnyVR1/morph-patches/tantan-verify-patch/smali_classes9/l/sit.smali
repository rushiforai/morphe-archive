.class public final synthetic Ll/sit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vit;


# direct methods
.method public synthetic constructor <init>(Ll/vit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sit;->a:Ll/vit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sit;->a:Ll/vit;

    check-cast p1, Ll/nfd0;

    invoke-static {p0, p1}, Ll/vit;->U3(Ll/vit;Ll/nfd0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
