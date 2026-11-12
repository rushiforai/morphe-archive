.class public final Lcri;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lcri;

.field public static final b:Lbri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcri;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcri;->a:Lcri;

    new-instance v0, Lbri;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcri;->b:Lbri;

    return-void
.end method
