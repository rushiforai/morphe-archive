.class Ll/dvx$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dvx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field final synthetic d:Ll/dvx;


# direct methods
.method public constructor <init>(Ll/dvx;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dvx$a;->d:Ll/dvx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/dvx$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dvx$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/dvx$a;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
