.class public Lcom/hihonor/push/sdk/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/hihonor/push/sdk/z$a;


# direct methods
.method public constructor <init>(Lcom/hihonor/push/sdk/z$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hihonor/push/sdk/y;->b:Lcom/hihonor/push/sdk/z$a;

    .line 2
    .line 3
    iput p2, p0, Lcom/hihonor/push/sdk/y;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hihonor/push/sdk/y;->b:Lcom/hihonor/push/sdk/z$a;

    .line 2
    .line 3
    iget p0, p0, Lcom/hihonor/push/sdk/y;->a:I

    .line 4
    .line 5
    invoke-static {p0}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->fromCode(I)Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/hihonor/push/sdk/z$a;->a(Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
