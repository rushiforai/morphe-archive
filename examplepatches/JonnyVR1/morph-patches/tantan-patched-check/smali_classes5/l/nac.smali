.class public final synthetic Ll/nac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:[I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>([II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nac;->a:[I

    iput p2, p0, Ll/nac;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nac;->a:[I

    iget p0, p0, Ll/nac;->b:I

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Q1([IILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    return-void
.end method
