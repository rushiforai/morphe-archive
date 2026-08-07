.class public Ll/hvb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wc80;


# static fields
.field public static b:Ljava/lang/String; = "QQ_SESSION"


# instance fields
.field public a:Ll/fvb0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fvb0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/fvb0;-><init>(Ll/wc80;Landroid/app/Activity;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hvb0;->a:Ll/fvb0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/share_sdk/content/Content;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hvb0;->a:Ll/fvb0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p0}, Ll/fvb0;->k(Lcom/p1/mobile/share_sdk/content/Content;Ll/wc80;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/g3f0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hvb0;->a:Ll/fvb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fvb0;->j(Ll/g3f0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/hvb0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
