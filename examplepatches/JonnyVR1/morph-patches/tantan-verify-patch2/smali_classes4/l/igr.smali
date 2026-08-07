.class public final synthetic Ll/igr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/igr;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/igr;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/igr;->c:Ll/z20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/igr;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/igr;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/igr;->c:Ll/z20;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0, p1}, Ll/rgr;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
