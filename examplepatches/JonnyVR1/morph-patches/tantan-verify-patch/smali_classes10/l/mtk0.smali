.class public final synthetic Ll/mtk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/otk0;


# direct methods
.method public synthetic constructor <init>(Ll/otk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mtk0;->a:Ll/otk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mtk0;->a:Ll/otk0;

    check-cast p1, Ll/wod0;

    invoke-static {p0, p1}, Ll/otk0;->u4(Ll/otk0;Ll/wod0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
