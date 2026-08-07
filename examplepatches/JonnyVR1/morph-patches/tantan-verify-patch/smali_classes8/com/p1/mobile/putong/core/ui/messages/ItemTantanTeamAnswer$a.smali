.class public Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static INSTANCE:Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/xyd0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/xyd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->b:Ll/xyd0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->c(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;)Ljava/util/HashSet;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->e()Ljava/util/HashSet;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 14
    .line 15
    new-instance v1, Ll/xyd0;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "tantanteam_answer_result_set_"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-direct {v1, v2, v3}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;-><init>(Ljava/lang/String;Ll/xyd0;)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 51
    .line 52
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;

    .line 53
    .line 54
    return-object p0
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->b:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashSet;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->b:Ll/xyd0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final e()Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemTantanTeamAnswer$a;->b:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/HashSet;

    .line 8
    .line 9
    return-object p0
.end method
