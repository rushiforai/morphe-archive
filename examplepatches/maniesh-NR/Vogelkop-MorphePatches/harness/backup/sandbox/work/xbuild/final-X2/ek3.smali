.class public final Lek3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgj;


# instance fields
.field public final synthetic a:Lfk3;


# direct methods
.method public constructor <init>(Lfk3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lek3;->a:Lfk3;

    return-void
.end method


# virtual methods
.method public final a(IILjava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lek3;->a:Lfk3;

    iget-byte p1, p0, Lfk3;->A:B

    and-int/2addr p2, p1

    if-eqz p2, :cond_f

    iget-object p0, p0, Lm93;->w:Lig;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_f
    return-void
.end method
