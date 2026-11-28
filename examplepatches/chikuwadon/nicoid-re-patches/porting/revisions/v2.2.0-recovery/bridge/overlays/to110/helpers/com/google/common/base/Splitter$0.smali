.class public final synthetic Lcom/google/common/base/Splitter$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Splitter$Strategy;


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/common/base/Splitter$0;->f$0:I

    return-void
.end method


# virtual methods
.method public final iterator(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .registers 3

    .line 0
    iget p0, p0, Lcom/google/common/base/Splitter$0;->f$0:I

    invoke-static {p0, p1, p2}, Lcom/google/common/base/Splitter;->lambda$fixedLength$0(ILcom/google/common/base/Splitter;Ljava/lang/CharSequence;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
