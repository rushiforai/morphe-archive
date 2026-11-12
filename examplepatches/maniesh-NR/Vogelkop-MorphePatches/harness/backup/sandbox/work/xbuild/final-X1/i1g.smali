.class public final Li1g;
.super Lp58;
.source "SourceFile"


# static fields
.field public static final b:Li1g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Li1g;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lp58;-><init>(Z)V

    sput-object v0, Li1g;->b:Li1g;

    return-void
.end method
