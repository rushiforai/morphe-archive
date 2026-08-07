.class public final synthetic Ll/mby;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/mby;->a:Z

    iput-object p2, p0, Ll/mby;->b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/mby;->a:Z

    iget-object p0, p0, Ll/mby;->b:Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Ll/oby;->h(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
