.class public final synthetic Lmim;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqim;


# direct methods
.method public synthetic constructor <init>(Lqim;B)V
    .registers 3

    iput-byte p2, p0, Lmim;->a:B

    iput-object p1, p0, Lmim;->b:Lqim;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lmim;->a:B

    iget-object p0, p0, Lmim;->b:Lqim;

    invoke-virtual {p0}, Lqim;->a()V

    return-void
.end method
