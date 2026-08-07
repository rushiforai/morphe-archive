.class public final synthetic Ll/z6n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/b7n0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/b7n0;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z6n0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/z6n0;->b:Ll/b7n0;

    iput-object p3, p0, Ll/z6n0;->c:Ljava/lang/String;

    iput p4, p0, Ll/z6n0;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z6n0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/z6n0;->b:Ll/b7n0;

    iget-object v2, p0, Ll/z6n0;->c:Ljava/lang/String;

    iget p0, p0, Ll/z6n0;->d:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    invoke-static {v0, v1, v2, p0, p1}, Ll/b7n0;->N3(Ljava/lang/String;Ll/b7n0;Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;)V

    return-void
.end method
