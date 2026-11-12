.class public final Lbnn;
.super Ldnn;
.source "SourceFile"


# instance fields
.field public final a:Lqjn;


# direct methods
.method public constructor <init>(Lqjn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbnn;->a:Lqjn;

    return-void
.end method


# virtual methods
.method public final a(Lann;)V
    .registers 2

    invoke-interface {p1, p0}, Lann;->u(Lbnn;)V

    return-void
.end method
