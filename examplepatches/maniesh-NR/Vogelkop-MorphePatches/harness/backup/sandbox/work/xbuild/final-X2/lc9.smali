.class public final synthetic Llc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lnc9;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lnc9;F)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llc9;->a:Lnc9;

    iput p2, p0, Llc9;->b:F

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Llc9;->a:Lnc9;

    iget-object v0, v0, Lnc9;->c:Lpe9;

    iget p0, p0, Llc9;->b:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-virtual {v0, p0}, Lpe9;->run(Ljava/lang/Object;)V

    return-void
.end method
