.class public final synthetic Ll/kto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y06;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/vto;ZZLrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kto;->a:Ll/vto;

    iput-boolean p2, p0, Ll/kto;->b:Z

    iput-boolean p3, p0, Ll/kto;->c:Z

    iput-object p4, p0, Ll/kto;->d:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final f(Lcom/android/billingclient/api/d;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kto;->a:Ll/vto;

    iget-boolean v1, p0, Ll/kto;->b:Z

    iget-boolean v2, p0, Ll/kto;->c:Z

    iget-object v3, p0, Ll/kto;->d:Lrx/subjects/a;

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ll/vto;->P(Ll/vto;ZZLrx/subjects/a;Lcom/android/billingclient/api/d;Ljava/lang/String;)V

    return-void
.end method
