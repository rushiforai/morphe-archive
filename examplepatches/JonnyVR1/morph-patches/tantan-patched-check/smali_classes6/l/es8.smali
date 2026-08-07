.class public final synthetic Ll/es8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ms8;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ms8;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es8;->a:Ll/ms8;

    iput-object p2, p0, Ll/es8;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/es8;->a:Ll/ms8;

    iget-object p0, p0, Ll/es8;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, p0, p1}, Ll/ms8;->v0(Ll/ms8;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
