.class public Ll/hki$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hki;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:[B

.field public e:Lcom/idv/identity/platform/config/OSSConfig;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hki$c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/hki$c;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hki$c;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hki$c;->d:[B

    .line 11
    .line 12
    iput-object p5, p0, Ll/hki$c;->e:Lcom/idv/identity/platform/config/OSSConfig;

    .line 13
    .line 14
    return-void
.end method
