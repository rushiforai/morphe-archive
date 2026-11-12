.class public final Lcnn;
.super Ldnn;
.source "SourceFile"


# instance fields
.field public final a:Lqjn;


# direct methods
.method public constructor <init>(Lqjn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcnn;->a:Lqjn;

    return-void
.end method


# virtual methods
.method public final a(Lann;)V
    .registers 2

    invoke-interface {p1, p0}, Lann;->z(Lcnn;)V

    return-void
.end method
