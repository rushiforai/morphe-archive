.class public final Ll/pzm$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pzm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Ll/pzm;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/pzm;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/pzm;-><init>(Ll/qzm;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/pzm$a;->INSTANCE:Ll/pzm;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/pzm;
    .locals 1

    .line 1
    sget-object v0, Ll/pzm$a;->INSTANCE:Ll/pzm;

    return-object v0
.end method
