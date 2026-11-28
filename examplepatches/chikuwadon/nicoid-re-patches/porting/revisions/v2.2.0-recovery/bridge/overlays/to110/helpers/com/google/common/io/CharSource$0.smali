.class public final synthetic Lcom/google/common/io/CharSource$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/io/BufferedReader;


# direct methods
.method public synthetic constructor <init>(Ljava/io/BufferedReader;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/io/CharSource$0;->f$0:Ljava/io/BufferedReader;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/io/CharSource$0;->f$0:Ljava/io/BufferedReader;

    invoke-static {p0}, Lcom/google/common/io/CharSource;->lambda$lines$0(Ljava/io/BufferedReader;)V

    return-void
.end method
