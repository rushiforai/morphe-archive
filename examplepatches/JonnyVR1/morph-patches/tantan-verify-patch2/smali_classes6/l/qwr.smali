.class public final synthetic Ll/qwr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;

.field public final synthetic b:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwr;->a:Ljava/util/HashSet;

    iput-object p2, p0, Ll/qwr;->b:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qwr;->a:Ljava/util/HashSet;

    iget-object p0, p0, Ll/qwr;->b:Ljava/util/HashSet;

    check-cast p1, Ll/pwr$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/avatarline/LiveAvatarLineCardView;->b(Ljava/util/HashSet;Ljava/util/HashSet;Ll/pwr$a;)V

    return-void
.end method
