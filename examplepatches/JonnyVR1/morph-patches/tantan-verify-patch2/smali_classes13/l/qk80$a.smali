.class public Ll/qk80$a;
.super Ll/ur2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qk80;->q(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/qk80;


# direct methods
.method public constructor <init>(Ll/qk80;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qk80$a;->b:Ll/qk80;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qk80$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ur2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
