.class public final synthetic Ll/s7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t7i;


# direct methods
.method public synthetic constructor <init>(Ll/t7i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s7i;->a:Ll/t7i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s7i;->a:Ll/t7i;

    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {p0, p1}, Ll/t7i;->C(Ll/t7i;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
