.class public final LI/a;
.super LI/b;
.source "SourceFile"


# static fields
.field public static final b:LI/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, LI/a;

    invoke-direct {v0}, LI/b;-><init>()V

    sput-object v0, LI/a;->b:LI/a;

    return-void
.end method
