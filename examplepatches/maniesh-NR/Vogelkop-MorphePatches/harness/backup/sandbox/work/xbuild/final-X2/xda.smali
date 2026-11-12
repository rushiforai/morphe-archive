.class public final Lxda;
.super Lshf;
.source "SourceFile"


# static fields
.field public static final e:Lxda;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lxda;

    invoke-direct {v0}, Lshf;-><init>()V

    sput-object v0, Lxda;->e:Lxda;

    return-void
.end method
