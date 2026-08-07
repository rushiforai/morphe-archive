.class Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d610$c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->initApm(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$did:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB$1;->val$did:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB$1;->val$did:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
