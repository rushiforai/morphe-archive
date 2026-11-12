.class public abstract Lv5b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp2;

.field public static final b:Lhp2;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhp2;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lhp2;-><init>(B)V

    sput-object v0, Lv5b;->a:Lhp2;

    new-instance v0, Lhp2;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lhp2;-><init>(B)V

    sput-object v0, Lv5b;->b:Lhp2;

    return-void
.end method
