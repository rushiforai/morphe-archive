.class final Lcom/android/billingclient/api/l0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Lcom/android/billingclient/api/d;

.field private final b:I


# direct methods
.method public constructor <init>(Lcom/android/billingclient/api/d;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/l0;->a:Lcom/android/billingclient/api/d;

    iput p2, p0, Lcom/android/billingclient/api/l0;->b:I

    return-void
.end method


# virtual methods
.method public final a()Lcom/android/billingclient/api/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/l0;->a:Lcom/android/billingclient/api/d;

    return-object p0
.end method

.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/billingclient/api/l0;->b:I

    return p0
.end method
