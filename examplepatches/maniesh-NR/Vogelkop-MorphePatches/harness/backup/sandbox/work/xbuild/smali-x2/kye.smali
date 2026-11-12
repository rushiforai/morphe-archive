.class public final Lkye;
.super Lp58;
.source "SourceFile"


# static fields
.field public static final b:Lkye;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkye;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Lkye;->b:Lkye;

    return-void
.end method
