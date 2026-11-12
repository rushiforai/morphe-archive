.class public final Lbpk;
.super Lryd;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(IIB)V
    .registers 4

    iput-byte p3, p0, Lbpk;->c:B

    invoke-direct {p0, p1, p2}, Lryd;-><init>(II)V

    return-void
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "topOffset"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "bottomOffset"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "topOffsetRatio"

    const-wide/16 v1, 0x0

    :try_start_1b
    invoke-virtual {v0, p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1e} :catch_23

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catch_23
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final a(Lto9;)V
    .registers 8

    iget-byte p0, p0, Lbpk;->c:B

    const-string v0, "delete from tokens"

    packed-switch p0, :pswitch_data_1e0

    const-string p0, "alter table tokens add column transfer_method text not null default \'\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_d
    const-string p0, "alter table wallets add column ext_id text"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_13
    const-string p0, "alter table collectibles add column url text not null default \'\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_19
    invoke-virtual {p1, v0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1d
    invoke-virtual {p1}, Lto9;->h()V

    :try_start_20
    const-string p0, "alter table accounts rename to _accounts"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "alter table tokens rename to _tokens"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "alter table collectibles rename to _collectibles"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS `collectibles` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `account_id` INTEGER NOT NULL, `contract` TEXT NOT NULL, `name` TEXT NOT NULL, `updated` INTEGER NOT NULL, `token_id` TEXT NOT NULL, `icon` TEXT NOT NULL, `description` TEXT NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_collectibles_account_id` ON `collectibles` (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS `tokens` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `account_id` INTEGER NOT NULL, `updated` INTEGER NOT NULL, `amount` TEXT NOT NULL, `contract` TEXT NOT NULL, `name` TEXT NOT NULL, `symbol` TEXT NOT NULL, `decimals` INTEGER NOT NULL, `type` INTEGER NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_tokens_account_id` ON `tokens` (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS `accounts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `wallet_id` INTEGER NOT NULL, `address` TEXT NOT NULL, `amount` TEXT NOT NULL, `updated` INTEGER NOT NULL, `used` INTEGER NOT NULL, FOREIGN KEY(`wallet_id`) REFERENCES `wallets`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_accounts_wallet_id` ON `accounts` (`wallet_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "insert into accounts     select a.* from wallets w, _accounts a                  where a.wallet_id = w.id"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "insert into tokens       select t.* from wallets w, _accounts a, _tokens t       where a.wallet_id = w.id and a.id = t.account_id"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "insert into collectibles select c.* from wallets w, _accounts a, _collectibles c where a.wallet_id = w.id and a.id = c.account_id"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "drop table _collectibles"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "drop table _tokens"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "drop table _accounts"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    invoke-virtual {p1}, Lto9;->s()V
    :try_end_6e
    .catchall {:try_start_20 .. :try_end_6e} :catchall_72

    invoke-virtual {p1}, Lto9;->m()V

    return-void

    :catchall_72
    move-exception p0

    invoke-virtual {p1}, Lto9;->m()V

    throw p0

    :pswitch_77
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "alter table wallets add column blockchain integer not null default \""

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lb85;->c:Lb85;

    iget v0, v0, Lb85;->a:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_92
    const-string p0, "alter table collectibles add column description text not null default \'\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_98
    const-string p0, "alter table tokens add column type integer not null default \"0\""

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_9e
    const-string p0, "ALTER TABLE tokens ADD COLUMN token_id TEXT NOT NULL DEFAULT \'\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE tokens_info ADD COLUMN token_id TEXT NOT NULL DEFAULT \'\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_a9
    const-string p0, "delete from accounts where coin_type = 118 and active = 0"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_af
    const-string p0, "CREATE TABLE IF NOT EXISTS deposits (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `hash` TEXT NOT NULL, `account_id` INTEGER NOT NULL, `type` INTEGER NOT NULL, `value` TEXT NOT NULL, `compensation` TEXT NOT NULL, `deposit_ts` INTEGER NOT NULL, `withdraw_ts` INTEGER NOT NULL, `status` INTEGER NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_deposits_account_id` ON deposits (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_ba
    const-string p0, "ALTER TABLE tokens ADD COLUMN quantization INTEGER NOT NULL DEFAULT 1"

    const-string v0, "ALTER TABLE tokens_info ADD COLUMN quantization INTEGER NOT NULL DEFAULT 1"

    const-string v1, "DELETE FROM tokens"

    const-string v2, "DELETE FROM tokens_info"

    invoke-static {p1, v1, v2, p0, v0}, Lj7c;->r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_c6
    :try_start_c6
    const-string p0, "alter table wallets add column passphrase_ack integer not null default \"0\""

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V
    :try_end_cb
    .catch Landroid/database/SQLException; {:try_start_c6 .. :try_end_cb} :catch_cb

    :catch_cb
    return-void

    :pswitch_cc
    const-string p0, "ALTER TABLE transactions ADD COLUMN transaction_type TEXT NOT NULL DEFAULT \'TRANSFER\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE transactions ADD COLUMN token_to_id TEXT"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE transactions ADD COLUMN token_to_type INTEGER"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_dc
    const-string p0, "ALTER TABLE accounts ADD COLUMN position INTEGER NOT NULL DEFAULT \'-1\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_e2
    const-string p0, "ALTER TABLE accounts ADD COLUMN active INTEGER NOT NULL DEFAULT \'1\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_e8
    const-string p0, "delete from tokens_info"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "delete from transactions"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_f6
    const-string p0, "DROP TABLE transactions"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS transactions (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `hash` TEXT NOT NULL, `log_index` INTEGER NOT NULL, `account_id` INTEGER NOT NULL, `from` TEXT NOT NULL, `to` TEXT NOT NULL, `type` INTEGER NOT NULL, `token_id` TEXT NOT NULL, `value` TEXT NOT NULL, `time` INTEGER NOT NULL, `block` INTEGER NOT NULL, `status` INTEGER NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_transactions_account_id` ON transactions (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_106
    const-string p0, "CREATE TABLE IF NOT EXISTS tokens (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `account_id` INTEGER NOT NULL, `updated` INTEGER NOT NULL, `amount` TEXT NOT NULL, `identifier` TEXT NOT NULL, `name` TEXT NOT NULL, `symbol` TEXT NOT NULL, `decimals` INTEGER NOT NULL, `type` INTEGER NOT NULL, `transfer_method` TEXT NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    const-string v0, "CREATE TABLE IF NOT EXISTS tokens_info (`net` INTEGER NOT NULL, `updated` INTEGER NOT NULL, `coin_type` INTEGER NOT NULL, `identifier` TEXT NOT NULL, `name` TEXT NOT NULL, `symbol` TEXT NOT NULL, `decimals` INTEGER NOT NULL, `type` INTEGER NOT NULL, `transfer_method` TEXT NOT NULL, PRIMARY KEY(`net`, `identifier`, `coin_type`))"

    const-string v1, "DROP TABLE tokens_info"

    const-string v2, "DROP TABLE tokens"

    invoke-static {p1, v1, v2, p0, v0}, Lj7c;->r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_tokens_account_id` ON tokens (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_117
    const-string p0, "alter table accounts add column unconfirmed text not null default \'0\'"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "alter table favorites add column coin_type integer not null default 60"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE UNIQUE INDEX `index_accounts_wallet_id_coin_type` ON `accounts` (`wallet_id`, `coin_type`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_127
    const-string p0, "DROP TABLE wallets"

    const-string v0, "CREATE TABLE IF NOT EXISTS wallets (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `secret` BLOB NOT NULL, `imported` INTEGER NOT NULL, `passphrase_ack` INTEGER NOT NULL, `ext_id` TEXT)"

    const-string v1, "CREATE TABLE IF NOT EXISTS wallets_tmp (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `secret` BLOB NOT NULL, `imported` INTEGER NOT NULL, `passphrase_ack` INTEGER NOT NULL, `ext_id` TEXT)"

    const-string v2, "INSERT INTO wallets_tmp SELECT id, secret, imported, passphrase_ack, ext_id FROM wallets"

    invoke-static {p1, v1, v2, p0, v0}, Lj7c;->r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "ALTER TABLE accounts ADD COLUMN coin_type INTEGER NOT NULL DEFAULT 60"

    const-string v0, "CREATE TABLE IF NOT EXISTS accounts_tmp (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `wallet_id` INTEGER NOT NULL, `coin_type` INTEGER NOT NULL, `data` TEXT NOT NULL, `amount` TEXT NOT NULL, `updated` INTEGER NOT NULL, `used` INTEGER NOT NULL, FOREIGN KEY(`wallet_id`) REFERENCES `wallets`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    const-string v1, "INSERT INTO wallets SELECT id, secret, imported, passphrase_ack, ext_id FROM wallets_tmp"

    const-string v2, "DROP TABLE wallets_tmp"

    invoke-static {p1, v1, v2, p0, v0}, Lj7c;->r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS accounts (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `wallet_id` INTEGER NOT NULL, `coin_type` INTEGER NOT NULL, `data` TEXT NOT NULL, `amount` TEXT NOT NULL, `updated` INTEGER NOT NULL, `used` INTEGER NOT NULL, FOREIGN KEY(`wallet_id`) REFERENCES `wallets`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    const-string v0, "INSERT INTO accounts SELECT id, wallet_id, coin_type, data, amount, updated, used FROM accounts_tmp"

    const-string v1, "INSERT INTO accounts_tmp SELECT id, wallet_id, coin_type, address, amount, updated, used FROM accounts"

    const-string v2, "DROP TABLE accounts"

    invoke-static {p1, v1, v2, p0, v0}, Lj7c;->r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "DROP TABLE accounts_tmp"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_accounts_wallet_id` ON accounts (`wallet_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_153
    const-string p0, "CREATE TABLE IF NOT EXISTS `favorites` (`name` TEXT NOT NULL, `address` TEXT NOT NULL, PRIMARY KEY(`address`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_159
    const-string p0, "CREATE TABLE IF NOT EXISTS `transactions` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `hash` TEXT NOT NULL, `log_index` INTEGER NOT NULL, `account_id` INTEGER NOT NULL, `from` TEXT NOT NULL, `to` TEXT NOT NULL, `type` INTEGER NOT NULL, `contract` TEXT NOT NULL, `value` TEXT NOT NULL, `time` INTEGER NOT NULL, `block` INTEGER NOT NULL, `status` INTEGER NOT NULL, FOREIGN KEY(`account_id`) REFERENCES `accounts`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE  INDEX `index_transactions_account_id` ON `transactions` (`account_id`)"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "CREATE TABLE IF NOT EXISTS `tokens_info` (`net` INTEGER NOT NULL, `updated` INTEGER NOT NULL, `contract` TEXT NOT NULL, `name` TEXT NOT NULL, `symbol` TEXT NOT NULL, `decimals` INTEGER NOT NULL, `type` INTEGER NOT NULL, `transfer_method` TEXT NOT NULL, PRIMARY KEY(`net`, `contract`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_169
    const-string p0, "SELECT * FROM entry"

    invoke-virtual {p1, p0}, Lto9;->r(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    const-string v0, "tabId"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    const-string v1, "descriptionMedium"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    const-string v2, "descriptionMini"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    :goto_181
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_1b6

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lbpk;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "UPDATE Entry SET descriptionMedium=? WHERE tabId=?"

    invoke-virtual {p1, v5, v4}, Lto9;->o(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lbpk;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v4, v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "UPDATE Entry SET descriptionMini=? WHERE tabId=?"

    invoke-virtual {p1, v4, v3}, Lto9;->o(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_181

    :cond_1b6
    return-void

    :pswitch_1b7
    const-string p0, "ALTER TABLE `partner_data` ADD COLUMN `autocomplete_chars` INT NOT NULL DEFAULT 2"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    const-string p0, "ALTER TABLE `partner_data` ADD COLUMN `recommend_chars` INT NOT NULL DEFAULT 2"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1c2
    const-string p0, "ALTER TABLE `partner_data` ADD COLUMN`global_score` REAL NOT NULL DEFAULT 0.0"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1c8
    const-string p0, "CREATE TABLE IF NOT EXISTS `domain_data` (`domain` TEXT NOT NULL, `rating` INTEGER NOT NULL, `last_updated` INTEGER NOT NULL, PRIMARY KEY(`domain`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1ce
    const-string p0, "CREATE TABLE IF NOT EXISTS `partner_tree` (`received` INTEGER NOT NULL, `keep_until` INTEGER NOT NULL, `tree` BLOB NOT NULL, PRIMARY KEY(`received`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1d4
    const-string p0, "CREATE TABLE IF NOT EXISTS `partner_data` (`id` INTEGER NOT NULL, `url` TEXT NOT NULL, `final_domain` TEXT NOT NULL, `title` TEXT NOT NULL, `score` REAL NOT NULL, `icon_url` TEXT NOT NULL, `received` INTEGER NOT NULL, `keep_until` INTEGER NOT NULL, PRIMARY KEY(`id`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_1da
    const-string p0, "CREATE TABLE IF NOT EXISTS `provider_info` (`type` INTEGER NOT NULL, `score` REAL NOT NULL, PRIMARY KEY(`type`))"

    invoke-virtual {p1, p0}, Lto9;->n(Ljava/lang/String;)V

    return-void

    :pswitch_data_1e0
    .packed-switch 0x0
        :pswitch_1da
        :pswitch_1d4
        :pswitch_1ce
        :pswitch_1c8
        :pswitch_1c2
        :pswitch_1b7
        :pswitch_169
        :pswitch_159
        :pswitch_153
        :pswitch_127
        :pswitch_117
        :pswitch_106
        :pswitch_f6
        :pswitch_e8
        :pswitch_e2
        :pswitch_dc
        :pswitch_cc
        :pswitch_c6
        :pswitch_ba
        :pswitch_af
        :pswitch_a9
        :pswitch_9e
        :pswitch_98
        :pswitch_92
        :pswitch_77
        :pswitch_1d
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
