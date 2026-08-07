.class public final Ll/lti$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lti;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field private static final INSTANCE:Ll/lti;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lti;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/lti;-><init>(Ll/mti;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/lti$b;->INSTANCE:Ll/lti;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/lti;
    .locals 1

    .line 1
    sget-object v0, Ll/lti$b;->INSTANCE:Ll/lti;

    return-object v0
.end method
