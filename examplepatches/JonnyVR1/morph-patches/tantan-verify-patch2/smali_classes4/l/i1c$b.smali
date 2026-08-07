.class public Ll/i1c$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i1c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static final INSTANCE:Ll/i1c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/i1c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/i1c;-><init>(Ll/i1c$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/i1c$b;->INSTANCE:Ll/i1c;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/i1c;
    .locals 1

    .line 1
    sget-object v0, Ll/i1c$b;->INSTANCE:Ll/i1c;

    .line 2
    .line 3
    return-object v0
.end method
