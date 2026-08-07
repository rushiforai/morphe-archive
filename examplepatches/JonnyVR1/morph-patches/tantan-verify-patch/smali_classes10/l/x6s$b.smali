.class public Ll/x6s$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x6s;->e(Ll/smc0;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/x6s;


# direct methods
.method public constructor <init>(Ll/x6s;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/x6s$b;->b:Ll/x6s;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x6s$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6s$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x6s$b;->b:Ll/x6s;

    .line 2
    .line 3
    invoke-static {p0}, Ll/x6s;->c(Ll/x6s;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
