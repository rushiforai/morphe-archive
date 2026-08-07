.class public Ll/fir$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ohr$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fir;->p(Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/LikedUser;

.field public final synthetic b:Ll/fir;


# direct methods
.method public constructor <init>(Ll/fir;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fir$c;->b:Ll/fir;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fir$c;->a:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fir$c;->a:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public getItemType()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
