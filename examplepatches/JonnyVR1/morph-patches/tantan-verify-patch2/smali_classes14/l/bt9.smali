.class public final synthetic Ll/bt9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/dt9;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/dt9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bt9;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/bt9;->b:Ll/dt9;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bt9;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/bt9;->b:Ll/dt9;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/dt9;->f3(Ljava/lang/String;Ll/dt9;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
