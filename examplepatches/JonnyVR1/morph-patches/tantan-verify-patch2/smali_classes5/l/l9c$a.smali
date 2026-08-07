.class public Ll/l9c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/l9c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static a:Ll/l9c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/l9c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/l9c;-><init>(Ll/m9c;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/l9c$a;->a:Ll/l9c;

    .line 8
    .line 9
    return-void
.end method
