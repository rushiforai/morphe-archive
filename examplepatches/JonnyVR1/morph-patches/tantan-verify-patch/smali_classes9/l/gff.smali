.class public final synthetic Ll/gff;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gff;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/gff;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gff;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/gff;->b:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$DrinkType;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputDrinking;->a(Ljava/lang/String;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$DrinkType;)V

    return-void
.end method
